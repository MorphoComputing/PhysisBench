# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1SHG\seeds\seed_0\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.451 A
- tm_score_ca_ordered: 0.9676892912974607
- heavy_atom_rmsd: 2.624 A
- sidechain_heavy_atom_rmsd: 3.397 A
- **all-atom quality (honest):** heavy 2.624 A, sidechain 3.397 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1378
- bin_accuracy: 0.662

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.45088597228145255
- ga_delta_rmsd: 0.041596826246317664  ga_fitness_mode: energy
- pre_local_rmsd: 0.46452189856423476  localized_anchor_rmsd: 0.4508859856962132

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L27-L28 → 12 conflicts (40%); V52 → 6 conflicts (20%); E11 → 4 conflicts (13%)
- explained: 22/30 conflicts by 3 root cause(s)
- metrics: hubs=16 (frac 0.291), conflicts/hub=1.9, max_incompat=3.79Å, chain_span=0.909
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L27-L28 + V52 + E11 — explain ~22/30 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E11** — severity 4.07, 5 conflict(s); suspect input ~`L28` (group: pull_in)
  - pull-in (wants closer): G45@6.3Å(now 9.2,conf 0.40)
  - L28↔G45: targets 18.8/6.3Å but partners are 9.4Å apart → too_close_together by 3.1Å
  - L27↔G45: targets 18.5/6.3Å but partners are 10.1Å apart → too_close_together by 2.1Å
  - N29↔G45: targets 18.0/6.3Å but partners are 9.7Å apart → too_close_together by 2.1Å
- **L28** — severity 2.71, 3 conflict(s); suspect input ~`V17` (group: pull_in)
  - pull-in (wants closer): V17@10.4Å(now 13.4,conf 0.34)
  - E11↔V17: targets 18.8/10.4Å but partners are 4.7Å apart → too_close_together by 3.7Å
  - T18↔V17: targets 16.4/10.4Å but partners are 3.7Å apart → too_close_together by 2.2Å
  - Q10↔V17: targets 19.2/10.4Å but partners are 6.7Å apart → too_close_together by 2.1Å
- **K21** — severity 2.17, 3 conflict(s); suspect input ~`V52` (group: pull_in)
  - pull-in (wants closer): V52@7.3Å(now 9.9,conf 0.36)
  - K33↔V52: targets 21.4/7.3Å but partners are 11.5Å apart → too_close_together by 2.5Å
  - N32↔V52: targets 21.9/7.3Å but partners are 12.7Å apart → too_close_together by 1.9Å
  - V52↔A49: targets 7.3/14.8Å but partners are 5.7Å apart → too_close_together by 1.8Å
- **L2** — severity 2.15, 2 conflict(s); suspect input ~`A49` (group: push_out)
  - push-out (wants farther): A50@17.9Å(now 14.4,conf 0.36)
  - A49↔A50: targets 10.9/17.9Å but partners are 3.8Å apart → too_close_together by 3.2Å
  - A50↔V52: targets 17.9/9.3Å but partners are 5.4Å apart → too_close_together by 3.1Å
- **G45** — severity 2.10, 3 conflict(s); suspect input ~`L28` (group: pull_in)
  - pull-in (wants closer): E11@6.3Å(now 9.2,conf 0.40)
  - E11↔L28: targets 6.3/8.7Å but partners are 17.4Å apart → too_far_apart by 2.4Å
  - E11↔Q10: targets 6.3/12.0Å but partners are 3.8Å apart → too_close_together by 1.9Å
  - E11↔L27: targets 6.3/8.7Å but partners are 16.8Å apart → too_far_apart by 1.8Å
- **V52** — severity 1.51, 2 conflict(s); suspect input ~`K21` (group: pull_in)
  - pull-in (wants closer): K21@7.3Å(now 9.9,conf 0.36)
  - A49↔K21: targets 4.6/7.3Å but partners are 14.2Å apart → too_far_apart by 2.2Å
  - K21↔N32: targets 7.3/11.9Å but partners are 21.3Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=24 · 3-10(G)=11 · coil(C)=12

```
ECGECHECEGCHEHEEEEGECHECECCEEHHEGEEEGEGGGCEGECECHGHEGEC
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=0 · sheet=58
  - L4 ↔ Y9  (sheet)
  - L4 ↔ K20  (sheet)
  - L4 ↔ D23  (sheet)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ T18  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - S13 ↔ T18  (sheet)
  - R15 ↔ W35  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - V17 ↔ D23  (sheet)
  - V17 ↔ L25  (sheet)
  - V17 ↔ W35  (sheet)
  - V17 ↔ W36  (sheet)
  - T18 ↔ D23  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=200 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=120 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1991 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
