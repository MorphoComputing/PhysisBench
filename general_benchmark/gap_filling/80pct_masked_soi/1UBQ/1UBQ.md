# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_6\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.894 A
- tm_score_ca_ordered: 0.9637681463991825
- heavy_atom_rmsd: 2.575 A
- sidechain_heavy_atom_rmsd: 3.191 A
- **all-atom quality (honest):** heavy 2.575 A, sidechain 3.191 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 797
- bin_accuracy: 0.900

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=5.410851822227786 -> 4.770184286593248 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8935737523343613
- ga_delta_rmsd: 3.515703354423945  ga_fitness_mode: energy
- pre_local_rmsd: 0.8959486282052246  localized_anchor_rmsd: 0.8935712580158888

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 14 conflicts (100%)
- explained: 14/14 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.041), conflicts/hub=4.7, max_incompat=3.56Å, chain_span=0.838
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~14/14 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 18.32, 9 conflict(s); suspect input ~`L66` (group: push_out)
  - pull-in (wants closer): K62@27.5Å(now 31.0,conf 1.00), P18@27.5Å(now 30.0,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 20.2,conf 0.72), I12@25.6Å(now 23.1,conf 0.70), R41@15.8Å(now 11.8,conf 0.55)
  - V69↔L66: targets 10.8/24.3Å but partners are 9.9Å apart → too_close_together by 3.6Å
  - L70↔L66: targets 8.0/24.3Å but partners are 12.8Å apart → too_close_together by 3.5Å
  - H67↔L66: targets 17.2/24.3Å but partners are 3.8Å apart → too_close_together by 3.3Å
- **L66** — severity 7.11, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 20.2,conf 0.72)
  - V69↔G74: targets 10.6/24.3Å but partners are 10.5Å apart → too_close_together by 3.3Å
  - L70↔G74: targets 13.0/24.3Å but partners are 8.6Å apart → too_close_together by 2.7Å
  - R71↔G74: targets 16.9/24.3Å but partners are 5.4Å apart → too_close_together by 2.0Å
- **I12** — severity 1.37, 1 conflict(s); suspect input ~`L70` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 23.1,conf 0.70)
  - G74↔L70: targets 25.6/14.5Å but partners are 8.6Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=27 · 3-10(G)=19 · coil(C)=2

```
EEEGGEGHCEEGGGGEGHHEEHHHHHHHGHHEGGECHHHEEEGEHHEGEEGHEEHHHEHHEEHEEGGEGGGHHE
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=10 · sheet=40
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - G52 ↔ S56  (helix)
  - L55 ↔ N59  (helix)
  - N59 ↔ E63  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ V16  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ V16  (sheet)
  - T6 ↔ T11  (sheet)
  - V16 ↔ T21  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=244 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5806 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1UBQ.ensemble.pdb`)
- RMSF mean=3.141Å max=7.93Å (per-residue in .per_residue.csv)
- most flexible residues: 46, 45, 31, 47, 32

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=39.9 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 5, 7, 8, 9, 13, 14, 15, 16, 17, 19, 20, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 41, 42, 43, 44, 45, 46, 47, 48, 49, 57, 58, 59, 60, 61, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1UBQ.pae.csv`
- mean=0.692Å · max=3.261Å · AlphaFold-PAE analog (low block = rigid unit/domain)
