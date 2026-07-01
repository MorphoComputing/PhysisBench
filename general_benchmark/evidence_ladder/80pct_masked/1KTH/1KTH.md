# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1KTH/sequence/1KTH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1KTH/seeds/seed_0/1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 4.384 A
- tm_score_ca_ordered: 0.40726350776411097
- heavy_atom_rmsd: 6.129 A
- sidechain_heavy_atom_rmsd: 7.378 A
- **all-atom quality (honest):** heavy 6.129 A, sidechain 7.378 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 286
- bin_accuracy: 0.531

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.383565060063047
- ga_delta_rmsd: 0.3794965409380868  ga_fitness_mode: energy
- pre_local_rmsd: 4.41207788831183  localized_anchor_rmsd: 4.383555091037458

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T26 → 5 conflicts (56%); Y22-D23 → 3 conflicts (33%)
- explained: 8/9 conflicts by 2 root cause(s)
- metrics: hubs=5 (frac 0.089), conflicts/hub=1.8, max_incompat=4.44Å, chain_span=0.214
- **fix-first:** [LOW_CONFLICT] Root cause(s): T26 + Y22-D23 — explain ~8/9 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T26** — severity 6.23, 5 conflict(s); suspect input ~`Y22` (group: push_out)
  - push-out (wants farther): G36@25.3Å(now 22.7,conf 0.69), E41@18.6Å(now 11.9,conf 0.55)
  - E41↔Y22: targets 18.6/8.6Å but partners are 6.9Å apart → too_close_together by 3.1Å
  - G36↔F32: targets 25.3/14.9Å but partners are 7.8Å apart → too_close_together by 2.5Å
  - G36↔W33: targets 25.3/18.7Å but partners are 4.4Å apart → too_close_together by 2.2Å
- **A30** — severity 2.42, 1 conflict(s); suspect input ~`T1` (group: push_out)
  - pull-in (wants closer): Y22@6.4Å(now 10.3,conf 0.55)
  - push-out (wants farther): T1@17.4Å(now 14.7,conf 0.55)
  - Y22↔T1: targets 6.4/17.4Å but partners are 6.6Å apart → too_close_together by 4.4Å
- **K27** — severity 2.21, 1 conflict(s); suspect input ~`N40` (group: push_out)
  - push-out (wants farther): C37@26.0Å(now 22.8,conf 0.72), N40@18.4Å(now 12.4,conf 0.55)
  - D23↔N40: targets 5.7/18.4Å but partners are 8.7Å apart → too_close_together by 4.0Å
- **D23** — severity 1.98, 1 conflict(s); suspect input ~`K8` (group: push_out)
  - push-out (wants farther): G39@15.6Å(now 12.2,conf 0.55)
  - G39↔K8: targets 15.6/7.9Å but partners are 4.0Å apart → too_close_together by 3.6Å
- **L18** — severity 1.09, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): W33@4.7Å(now 9.1,conf 0.59), C29@12.7Å(now 15.9,conf 0.55)
  - W33↔C37: targets 4.7/13.3Å but partners are 6.6Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=25 · 3-10(G)=10 · coil(C)=4

```
EEHHHECGGGECHHHHEEEEEEECEHEECEGGHHEHEGGHEEEEHGGHEGEHEHHE
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=2 · sheet=59
  - G36 ↔ N40  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ Y21  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ Y22  (sheet)
  - L6 ↔ D23  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ L18  (sheet)
  - G11 ↔ K19  (sheet)
  - I17 ↔ G35  (sheet)
  - I17 ↔ C37  (sheet)
  - L18 ↔ G35  (sheet)
  - L18 ↔ C37  (sheet)
  - K19 ↔ A30  (sheet)
  - K19 ↔ G35  (sheet)
  - W20 ↔ A30  (sheet)
  - Y21 ↔ K27  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=242 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=131 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1379 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1KTH.ensemble.pdb`)
- RMSF mean=2.59Å max=6.887Å (per-residue in .per_residue.csv)
- most flexible residues: 30, 25, 28, 2, 31

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1KTH.pae.csv`
- mean=0.848Å · max=5.268Å · AlphaFold-PAE analog (low block = rigid unit/domain)
