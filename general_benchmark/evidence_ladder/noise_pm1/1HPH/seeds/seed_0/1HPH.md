# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.135 A
- tm_score_ca_ordered: 0.2861208407332846
- heavy_atom_rmsd: 6.554 A
- sidechain_heavy_atom_rmsd: 7.567 A
- **all-atom quality (honest):** heavy 6.554 A, sidechain 7.567 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 528
- bin_accuracy: 0.661

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.134709351797704
- ga_delta_rmsd: -0.7164333145878476  ga_fitness_mode: energy
- pre_local_rmsd: 5.134662049546778  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N9 → 6 conflicts (38%); L14 → 5 conflicts (31%)
- explained: 11/16 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.257), conflicts/hub=1.8, max_incompat=2.84Å, chain_span=0.714
- **fix-first:** [LOW_CONFLICT] Root cause(s): N9 + L14 — explain ~11/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L27** — severity 2.49, 3 conflict(s); suspect input ~`N9` (group: pull_in)
  - pull-in (wants closer): N9@16.6Å(now 19.3,conf 0.35)
  - push-out (wants farther): A35@11.7Å(now 8.0,conf 0.34), V34@11.8Å(now 8.1,conf 0.34)
  - H8↔N9: targets 22.6/16.6Å but partners are 3.5Å apart → too_close_together by 2.5Å
  - E3↔N9: targets 26.4/16.6Å but partners are 7.4Å apart → too_close_together by 2.5Å
  - I4↔N9: targets 25.9/16.6Å but partners are 7.2Å apart → too_close_together by 2.1Å
- **L14** — severity 2.04, 3 conflict(s); suspect input ~`I4` (group: pull_in)
  - pull-in (wants closer): R24@10.2Å(now 13.1,conf 0.34)
  - R24↔I4: targets 10.2/12.3Å but partners are 25.1Å apart → too_far_apart by 2.6Å
  - E3↔R24: targets 13.0/10.2Å but partners are 25.0Å apart → too_far_apart by 1.7Å
  - R24↔S2: targets 10.2/15.3Å but partners are 27.2Å apart → too_far_apart by 1.7Å
- **N9** — severity 2.01, 3 conflict(s); suspect input ~`L27` (group: push_out)
  - pull-in (wants closer): L27@16.6Å(now 19.3,conf 0.35)
  - push-out (wants farther): E18@14.9Å(now 11.9,conf 0.34)
  - E18↔L14: targets 14.9/6.9Å but partners are 5.8Å apart → too_close_together by 2.1Å
  - L27↔Q5: targets 16.6/5.9Å but partners are 24.4Å apart → too_far_apart by 2.0Å
  - L27↔E3: targets 16.6/7.5Å but partners are 25.8Å apart → too_far_apart by 1.7Å
- **V20** — severity 1.09, 2 conflict(s); suspect input ~`V30` (group: pull_in)
  - pull-in (wants closer): V30@12.9Å(now 15.7,conf 0.34)
  - M17↔V30: targets 5.1/12.9Å but partners are 19.7Å apart → too_far_apart by 1.7Å
  - S16↔V30: targets 6.3/12.9Å but partners are 20.8Å apart → too_far_apart by 1.6Å
- **D29** — severity 1.03, 1 conflict(s); suspect input ~`L6` (group: pull_in)
  - pull-in (wants closer): L6@18.6Å(now 21.2,conf 0.37)
  - Q5↔L6: targets 25.3/18.6Å but partners are 3.9Å apart → too_close_together by 2.8Å
- **L23** — severity 0.98, 1 conflict(s); suspect input ~`A35` (group: push_out)
  - push-out (wants farther): A35@15.8Å(now 12.9,conf 0.34)
  - K26↔A35: targets 5.2/15.8Å but partners are 7.8Å apart → too_close_together by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=13 · 3-10(G)=7 · coil(C)=2

```
CEEGHHGHEGGGHEEEHEHGHHEHEHEHHEHEGCE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=4 · sheet=18
  - H13 ↔ M17  (helix)
  - M17 ↔ E21  (helix)
  - W22 ↔ K26  (helix)
  - R24 ↔ Q28  (helix)
  - S2 ↔ N9  (sheet)
  - E3 ↔ N9  (sheet)
  - N9 ↔ L14  (sheet)
  - N9 ↔ N15  (sheet)
  - N9 ↔ S16  (sheet)
  - N9 ↔ E18  (sheet)
  - L14 ↔ L23  (sheet)
  - N15 ↔ L23  (sheet)
  - S16 ↔ L23  (sheet)
  - E18 ↔ L23  (sheet)
  - E18 ↔ K25  (sheet)
  - L23 ↔ V30  (sheet)
  - K25 ↔ V30  (sheet)
  - K25 ↔ N32  (sheet)
  - K25 ↔ A35  (sheet)
  - L27 ↔ N32  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=89 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=5 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0274 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
