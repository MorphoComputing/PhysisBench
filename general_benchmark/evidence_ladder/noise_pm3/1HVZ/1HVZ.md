# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1HVZ\seeds\seed_1\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 3.413 A
- tm_score_ca_ordered: 0.06400235153063946
- heavy_atom_rmsd: 5.125 A
- sidechain_heavy_atom_rmsd: 6.242 A
- **all-atom quality (honest):** heavy 5.125 A, sidechain 6.242 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.062
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 91
- bin_accuracy: 0.385

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=15
- rigid_domain_reconvergence: applied=True accepted=15 rmsd=2.305148883080757 -> 0.8047033329141561 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.4129044486205364
- ga_delta_rmsd: -2.9873596772427606  ga_fitness_mode: energy
- pre_local_rmsd: 3.4130047343352126  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R8-C11 → 25 conflicts (96%)
- explained: 25/26 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.5), conflicts/hub=3.2, max_incompat=7.04Å, chain_span=0.875
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R8-C11 — explain ~25/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C2** — severity 4.99, 7 conflict(s); suspect input ~`C11` (group: push_out)
  - push-out (wants farther): C15@7.9Å(now 4.1,conf 0.23), G9@21.7Å(now 18.9,conf 0.29), R8@22.7Å(now 17.5,conf 0.34)
  - R8↔C11: targets 22.7/9.8Å but partners are 5.9Å apart → too_close_together by 7.0Å
  - R8↔L5: targets 22.7/8.2Å but partners are 10.3Å apart → too_close_together by 4.2Å
  - G9↔C11: targets 21.7/9.8Å but partners are 7.0Å apart → too_close_together by 4.9Å
- **C11** — severity 2.61, 4 conflict(s); suspect input ~`T16` (group: push_out)
  - push-out (wants farther): T16@18.5Å(now 11.7,conf 0.19)
  - I14↔T16: targets 8.5/18.5Å but partners are 5.5Å apart → too_close_together by 4.4Å
  - C4↔T16: targets 7.4/18.5Å but partners are 6.7Å apart → too_close_together by 4.4Å
  - L5↔T16: targets 5.6/18.5Å but partners are 10.1Å apart → too_close_together by 2.8Å
- **R8** — severity 2.29, 2 conflict(s); suspect input ~`C2` (group: push_out)
  - push-out (wants farther): C2@22.7Å(now 17.5,conf 0.34), I14@17.9Å(now 14.9,conf 0.18)
  - C2↔C11: targets 22.7/5.6Å but partners are 12.0Å apart → too_close_together by 5.0Å
  - I14↔C11: targets 17.9/5.6Å but partners are 9.1Å apart → too_close_together by 3.2Å
- **V10** — severity 2.16, 5 conflict(s); suspect input ~`C13` (group: pull_in)
  - pull-in (wants closer): R3@8.7Å(now 11.6,conf 0.19)
  - push-out (wants farther): R7@6.3Å(now 2.4,conf 0.32), T16@19.3Å(now 15.7,conf 0.21)
  - T16↔C13: targets 19.3/9.2Å but partners are 6.5Å apart → too_close_together by 3.6Å
  - T16↔R3: targets 19.3/8.7Å but partners are 8.3Å apart → too_close_together by 2.2Å
  - F1↔R3: targets 17.2/8.7Å but partners are 6.1Å apart → too_close_together by 2.3Å
- **T16** — severity 1.70, 3 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): C13@9.9Å(now 6.5,conf 0.16), V10@19.3Å(now 15.7,conf 0.21), C11@18.5Å(now 11.7,conf 0.19)
  - R12↔C11: targets 9.8/18.5Å but partners are 4.4Å apart → too_close_together by 4.3Å
  - R12↔V10: targets 9.8/19.3Å but partners are 6.2Å apart → too_close_together by 3.2Å
  - C13↔C11: targets 9.9/18.5Å but partners are 5.6Å apart → too_close_together by 3.0Å
- **I14** — severity 1.17, 2 conflict(s); suspect input ~`R8` (group: push_out)
  - push-out (wants farther): R8@17.9Å(now 14.9,conf 0.18)
  - R8↔C11: targets 17.9/8.5Å but partners are 5.9Å apart → too_close_together by 3.5Å
  - R7↔R8: targets 10.0/17.9Å but partners are 4.5Å apart → too_close_together by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=2 · 3-10(G)=1 · coil(C)=2

```
CHGHHHEHHHHHHEHC
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=6 · sheet=1
  - C2 ↔ C6  (helix)
  - C4 ↔ R8  (helix)
  - L5 ↔ G9  (helix)
  - C6 ↔ V10  (helix)
  - R8 ↔ R12  (helix)
  - C11 ↔ C15  (helix)
  - R7 ↔ I14  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=44 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=22 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7337 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0625

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
- Ramachandran forbidden fraction exceeds 5%.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HVZ.ensemble.pdb`)
- RMSF mean=1.354Å max=2.757Å (per-residue in .per_residue.csv)
- most flexible residues: 4, 6, 10, 1, 13

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HVZ.pae.csv`
- mean=0.413Å · max=2.629Å · AlphaFold-PAE analog (low block = rigid unit/domain)
