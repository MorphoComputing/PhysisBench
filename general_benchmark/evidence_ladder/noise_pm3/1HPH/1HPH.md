# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 3.275 A
- tm_score_ca_ordered: 0.3824328221927466
- heavy_atom_rmsd: 4.916 A
- sidechain_heavy_atom_rmsd: 6.109 A
- **all-atom quality (honest):** heavy 4.916 A, sidechain 6.109 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 528
- bin_accuracy: 0.358

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=3.6574915153954835 -> 3.0419997327167607 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.2754187889311286
- ga_delta_rmsd: -0.2661357805412137  ga_fitness_mode: energy
- pre_local_rmsd: 3.275465711984644  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L14-E18 → 137 conflicts (54%); N9-L10 → 32 conflicts (13%); R24-K26 → 18 conflicts (7%)
- explained: 187/253 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 0.971), conflicts/hub=7.4, max_incompat=9.25Å, chain_span=0.971
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L14-E18 + N9-L10 + R24-K26 — explain ~187/253 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L14** — severity 20.08, 21 conflict(s); suspect input ~`I4` (group: push_out)
  - pull-in (wants closer): R24@6.6Å(now 12.5,conf 0.30), I4@8.9Å(now 12.2,conf 0.19), M17@6.0Å(now 8.7,conf 0.35)
  - push-out (wants farther): D29@19.9Å(now 16.7,conf 0.23), K26@20.3Å(now 12.2,conf 0.24), L6@18.8Å(now 10.2,conf 0.20)
  - K26↔R24: targets 20.3/6.6Å but partners are 4.5Å apart → too_close_together by 9.2Å
  - K26↔W22: targets 20.3/7.7Å but partners are 5.5Å apart → too_close_together by 7.1Å
  - L10↔L6: targets 7.5/18.8Å but partners are 3.7Å apart → too_close_together by 7.6Å
- **K26** — severity 17.95, 21 conflict(s); suspect input ~`N15` (group: pull_in)
  - pull-in (wants closer): N15@10.0Å(now 14.4,conf 0.16)
  - push-out (wants farther): V30@9.1Å(now 4.7,conf 0.18), S16@17.4Å(now 14.5,conf 0.17), L14@20.3Å(now 12.2,conf 0.24), M17@20.2Å(now 13.6,conf 0.24)
  - M17↔R19: targets 20.2/7.9Å but partners are 4.2Å apart → too_close_together by 8.1Å
  - V20↔M17: targets 7.8/20.2Å but partners are 5.6Å apart → too_close_together by 6.9Å
  - W22↔L14: targets 6.5/20.3Å but partners are 8.2Å apart → too_close_together by 5.7Å
- **R24** — severity 17.46, 16 conflict(s); suspect input ~`L14` (group: pull_in)
  - pull-in (wants closer): L14@6.6Å(now 12.5,conf 0.30)
  - push-out (wants farther): L6@23.7Å(now 20.4,conf 0.41), H8@23.1Å(now 20.5,conf 0.37), E21@8.1Å(now 5.1,conf 0.21), L27@8.8Å(now 6.1,conf 0.19), V20@10.1Å(now 5.5,conf 0.16), K12@16.6Å(now 12.9,conf 0.15)
  - H8↔L14: targets 23.1/6.6Å but partners are 9.2Å apart → too_close_together by 7.3Å
  - L6↔L14: targets 23.7/6.6Å but partners are 10.2Å apart → too_close_together by 6.9Å
  - Q5↔L14: targets 23.0/6.6Å but partners are 10.9Å apart → too_close_together by 5.5Å
- **M17** — severity 13.90, 19 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): S2@19.2Å(now 21.9,conf 0.21), L14@6.0Å(now 8.7,conf 0.35)
  - push-out (wants farther): Q28@20.1Å(now 17.2,conf 0.23), H8@22.3Å(now 17.7,conf 0.32), L27@18.0Å(now 14.9,conf 0.18), K26@20.2Å(now 13.6,conf 0.24)
  - H8↔L14: targets 22.3/6.0Å but partners are 9.2Å apart → too_close_together by 7.0Å
  - V20↔K26: targets 5.6/20.2Å but partners are 8.7Å apart → too_close_together by 5.8Å
  - E21↔K26: targets 7.4/20.2Å but partners are 7.8Å apart → too_close_together by 5.0Å
- **E21** — severity 11.49, 17 conflict(s); suspect input ~`L10` (group: pull_in)
  - pull-in (wants closer): V1@21.1Å(now 23.7,conf 0.27), D29@9.5Å(now 13.2,conf 0.17), L10@10.3Å(now 15.3,conf 0.15)
  - push-out (wants farther): L6@21.9Å(now 18.8,conf 0.30), R24@8.1Å(now 5.1,conf 0.21), H31@19.7Å(now 15.7,conf 0.22), A35@21.7Å(now 15.1,conf 0.29), V30@16.4Å(now 12.0,conf 0.15)
  - H31↔D29: targets 19.7/9.5Å but partners are 2.8Å apart → too_close_together by 7.5Å
  - L6↔L10: targets 21.9/10.3Å but partners are 3.7Å apart → too_close_together by 7.9Å
  - A35↔Q28: targets 21.7/9.3Å but partners are 6.7Å apart → too_close_together by 5.6Å
- **E18** — severity 10.93, 15 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): H31@24.0Å(now 18.6,conf 0.43), W22@8.4Å(now 5.3,conf 0.20), Q5@20.2Å(now 16.9,conf 0.24), V30@17.8Å(now 15.2,conf 0.17), N9@18.5Å(now 11.2,conf 0.19)
  - N9↔H13: targets 18.5/6.7Å but partners are 4.4Å apart → too_close_together by 7.5Å
  - H31↔K26: targets 24.0/9.1Å but partners are 8.1Å apart → too_close_together by 6.8Å
  - L14↔N9: targets 7.0/18.5Å but partners are 6.0Å apart → too_close_together by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=8 · 3-10(G)=2 · coil(C)=2

```
CEHHHHHHGHHHHHEEHHEHHEHEHEHHHHEHHGC
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=11 · sheet=6
  - E3 ↔ M7  (helix)
  - L6 ↔ L10  (helix)
  - M7 ↔ G11  (helix)
  - L10 ↔ L14  (helix)
  - H13 ↔ M17  (helix)
  - L14 ↔ E18  (helix)
  - M17 ↔ E21  (helix)
  - E21 ↔ K25  (helix)
  - L23 ↔ L27  (helix)
  - K25 ↔ D29  (helix)
  - D29 ↔ F33  (helix)
  - N15 ↔ W22  (sheet)
  - S16 ↔ W22  (sheet)
  - R19 ↔ R24  (sheet)
  - R19 ↔ K26  (sheet)
  - R24 ↔ H31  (sheet)
  - K26 ↔ H31  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=11 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5739 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HPH.ensemble.pdb`)
- RMSF mean=1.848Å max=4.68Å (per-residue in .per_residue.csv)
- most flexible residues: 28, 1, 25, 27, 13

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HPH.pae.csv`
- mean=0.469Å · max=4.169Å · AlphaFold-PAE analog (low block = rigid unit/domain)
